using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;

namespace SupportLearning.ZOOM
{
    public class ZoomAPI
    {
        private static readonly HttpClient client = new HttpClient();
        private const string clientId = "XPmCLafRb6XZ5c8QCO6A";
        private const string clientSecret = "ewyR62trxJlfVKkykKyvDlfUjMTOFe8J";
        private const string secretToken = "AV94k1IZRliyuMsPiRftvA";

        public static async Task<JObject> GetMeetingInfo(string meetingId)
        {
            var request = new HttpRequestMessage(HttpMethod.Get, $"https://api.zoom.us/v2/meetings/{meetingId}");
            request.Headers.Add("Authorization", $"Bearer {secretToken}");

            var response = await client.SendAsync(request);

            if (response.IsSuccessStatusCode)
            {
                var result = await response.Content.ReadAsStringAsync();
                return JObject.Parse(result);
            }

            return null;
        }

        public static async Task<(string id, string password)> GetMeetingIdAndPassword(string meetingId)
        {
            var meetingInfo = await GetMeetingInfo(meetingId);
            if (meetingInfo != null)
            {
                string id = meetingInfo["id"].ToString();
                string password = meetingInfo["password"].ToString();
                return (id, password);
            }

            return (null, null);
        }
    }
}