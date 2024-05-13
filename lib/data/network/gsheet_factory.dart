import 'package:gsheets/gsheets.dart';

abstract class GSheetFactory {
  Future<Spreadsheet> create();
}

class GSheetFactoryImpl implements GSheetFactory {
  @override
  Future<Spreadsheet> create() async {
    String sheetID = "1EOkhNUuxlOefJr-38S3sr8iwoZUETk3Jc4wLgbxb7GE";

    String credentials = r"""{
  "type": "service_account",
  "project_id": "ieee-main-app-test",
  "private_key_id": "c839c6fb826030378222c34f2cc94a77e9985161",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDhfTygnOF+Dl5Z\nCPNMuOPLr5lr7QTUIeakeFlZ3iV202TZsUFbd1x6F3MHG78axBs2lhiAyoOc+J8F\ni7K+bd539ACBzpM1/QeIbvrSdVzV3yfYwZNqOqu9weRIzyRvaSCXvSMw2ufZ7wCR\noaePikkT9qxGcOqKViVW2LBeizuMTebimDg8L15Wen++q52pP4fFI+G45eUT0fye\njqPCVtBPvwfRJlkayBavTaW/b2mxUf6/R4j3thmKk6UWYzsohvNGanUNqqNbZfBB\n7E4WivDX6yMQAOu25MSuAAlY4yARlCmRgA3WmlbN39gvaJ8Fqe4Yr4B2w1aeB2eF\n4QdTP/a9AgMBAAECggEAISIj7H3g7ILz/iVAiv+ICYAODTvQv9MTbwt4Japs2t8J\nLKvNLMGHRzF2545+MFKspQK9Kv+XA1PNGiWC6FSAoiOqh2hxXTeHCdc06APy1kJq\nOoGHRc7FOabqAoDdm7lY3rMeHqmr8+wYq02Tr5XkUximC9u/uwAZkH9auym+YEkz\neTjiXm3SuPBmrnDngwADipxWdcZVQEwYTaqh5g/8HtB+rNVNMPk6/WW0onf/kS6c\n7tVEukLrhGuKAQ1eGpceboreQemYp6xN4u7ZYc6qLBt4bf0iW8K0E0oasu5UFup5\nWXacVO5kAOhch0nVsJiDZ3am6cW3tNDKAKM6EwTeSQKBgQD8HLw23A2ZGBiutEN8\n16cLA+SH5k1XbHct7bVfHm3mq/3j7vkYJxomTUssa93EGxRCIfYUrqKujKm51hes\n9Lc5ytfmHYN3e/ByePakRf99HB892DOiHRrGuXn0IL62eUr3FoPSVKvT5cE2zjoy\nwr5e+UyX0bgtGxZuZ9tHPfkaRwKBgQDk92bV9MhCbqDGz2b1s+NHdvni1NxrqcO+\nUliCPhkGK1B+Eqp2N9QdL6RQYhEWbe+GWHYZHcEDwjtpuF0ESa8NfvDNcSP3XPYP\nsi88KpvT/7NRX9kwDoQU3tOndGgRMqsfxGkEmRfnW7IGWnj9jk5KYMfPYQaoJDzE\njNfmuqek2wKBgG5um9cf7ujnkDA+j+1IfUgq7VjF/YzU2yOII1FF//fx0KWeEQiO\nYDr00n/jw+FZxzbsr2EB2grBXLslV3uQOg4blxSaSvL0nC9YYxkz/CSuQ9UQNhXF\nz+vKZOwVx9QgL0EqYJWqNxX7ZvX9wapoeYEajH1YBOflHJ9B6OA8+jeTAoGBAJBb\nJtvIK6Yup3EQ/CH221mIOn33pEzAyKeqtSDQU+ie0G3cCNrl0fbgvaDsY0eX4kb6\naOLm7nUXNWwvD34Pkq1YliuApKNlWcGFnuA5IOvlL8IjQwRYco/R+PF/o8kL//XU\nWD3M49Q67J+y1MtPuC6OnAs0agUCa8mj3s8aaW23AoGAHHw7UW1v1Iv1cUNw+vXG\nzLLdlY8nBkIkxAWXQJXHuKSUMEpzzCdV9Ox4p90B/2lJ49Ta4T0uXqWUTlUUwfzM\nO9YAuoXfiX5Od5B500TNvdHWj/RADtkzcYLHP6b7rOBQXHYiiGSB2L8aMsUo2uuM\nONBB6/rtQK9r41wVbucftGI=\n-----END PRIVATE KEY-----\n",
  "client_email": "ieee-app@ieee-main-app-test.iam.gserviceaccount.com",
  "client_id": "104852270055220059280",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/ieee-app%40ieee-main-app-test.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
""";

    GSheets gSheets = GSheets(credentials);
    final spread = await gSheets.spreadsheet(sheetID);

    return spread;
  }
}
