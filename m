From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Tue, 16 May 2017 17:20:38 +0200
Message-Id: <20170516152040.4619-2-enric.balletbo@collabora.com>
In-Reply-To: <20170516152040.4619-1-enric.balletbo@collabora.com>
References: <20170516152040.4619-1-enric.balletbo@collabora.com>
Subject: [linux-lvm] [PATCH v2 1/3] libdm: Add dm_find_unescaped_char to
	libdevmapper.
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alasdair Kergon <agk@redhat.com>, linux-lvm@redhat.com
Cc: Kees Cook <keescook@chromium.org>, Mike Snitzer <snitzer@redhat.com>

Add helper functions to split a string into tokens ignoring escaped
chars. The function finds the first token in the string that is delimited
by one non escaped char. In case it founds an escaped token finds next
token.

When a token is found the string is terminated by overwriting the
delimiter with a null byte ('\0') and the pointer to the search string
is updated to point past the token ready for the next call.

In case no delimiter was found, the token is taken to be the entire
string.

Aditionally there is dm_unescape_colons and dm_unescape_semicolons
helpers to unescape these characters in situ, it replaces all occurrences
of "\," or "\;" with ',' or ';'. This is normally used to unescape colons
and semi-colons used in boot format.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 libdm/.exported_symbols.Base |  3 ++
 libdm/libdevmapper.h         | 17 +++++++++
 libdm/libdm-string.c         | 82 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 102 insertions(+)

diff --git a/libdm/.exported_symbols.Base b/libdm/.exported_symbols.Base
index 4dc5c93..51c21de 100644
--- a/libdm/.exported_symbols.Base
+++ b/libdm/.exported_symbols.Base
@@ -66,6 +66,7 @@ dm_dump_memory_debug
 dm_escaped_len
 dm_escape_double_quotes
 dm_fclose
+dm_find_unescaped_char
 dm_format_dev
 dm_free_aux
 dm_get_library_version
@@ -279,8 +280,10 @@ dm_udev_get_sync_support
 dm_udev_set_checking
 dm_udev_set_sync_support
 dm_udev_wait
+dm_unescape_colons
 dm_unescape_colons_and_at_signs
 dm_unescape_double_quotes
+dm_unescape_semicolons
 dm_units_to_factor
 dm_uuid_prefix
 dm_vasprintf
diff --git a/libdm/libdevmapper.h b/libdm/libdevmapper.h
index 4bd32b4..7b6c1c0 100644
--- a/libdm/libdevmapper.h
+++ b/libdm/libdevmapper.h
@@ -2662,6 +2662,23 @@ void dm_unescape_colons_and_at_signs(char *src,
  */
 int dm_strncpy(char *dest, const char *src, size_t n);
 
+char *dm_unescape_colons(char *str);
+
+char *dm_unescape_semicolons(char *str);
+
+/*
+ * Splits a string into tokens ignoring escaped chars
+ *
+ * Updates @s to point after the token, ready for the next call.
+ *
+ * @s: The string to be searched
+ * @c: The character to search for
+ *
+ * Returns:
+ *   The string found or NULL.
+ */
+char *dm_find_unescaped_char(char **str, const char c);
+
 /*
  * Recognize unit specifier in the 'units' arg and return a factor
  * representing that unit. If the 'units' contains a prefix with digits,
diff --git a/libdm/libdm-string.c b/libdm/libdm-string.c
index 2085aa8..667f8dd 100644
--- a/libdm/libdm-string.c
+++ b/libdm/libdm-string.c
@@ -444,6 +444,88 @@ int dm_strncpy(char *dest, const char *src, size_t n)
 	return 0;
 }
 
+/*
+ * Unescape characters in situ, it replaces all occurrences of "\c"
+ * with 'c'. This is normally used to unescape colons and semi-colons used
+ * in boot format.
+ */
+static char *_unescape_char(char *str, const char c)
+{
+	int i = 0, j = 0;
+	int len = strlen(str);
+
+	if (len < 2)
+		return str;
+
+	while (j < len - 1) {
+		if (str[j] == '\\' && str[j + 1] == c) {
+			j = j + 2;
+			str[i++] = c;
+			continue;
+		}
+		str[i++] = str[j++];
+	}
+
+	if (j == len - 1)
+		str[i++] = str[j];
+
+	str[i] = '\0';
+
+	return str;
+}
+
+char *dm_unescape_colons(char *str)
+{
+	return _unescape_char(str, ',');
+}
+
+char *dm_unescape_semicolons(char *str)
+{
+	return _unescape_char(str, ';');
+}
+
+#define is_even(a) (((a) & 1) == 0)
+
+/*
+ * Splits a string into tokens ignoring escaped chars
+ *
+ * Updates @s to point after the token, ready for the next call.
+ *
+ * @str: The string to be searched
+ * @c: The character to search for
+ *
+ * Returns:
+ *   The string found or NULL.
+ */
+char *dm_find_unescaped_char(char **str, const char c)
+{
+	char *s = *str;
+	char *p = strchr(*str, c);
+
+	/* loop through all the characters */
+	while (p != NULL) {
+		/* scan backwards through preceding escapes */
+		char* q = p;
+		while (q > s && *(q - 1) == '\\')
+			--q;
+		/* even number of escapes so c is a token */
+		if (is_even( p - q )) {
+			*p = '\0';
+			*str = p + 1;
+			return s;
+		}
+		/* else odd escapes so c is escaped, keep going */
+		p = strchr(p + 1, c);
+	}
+
+	if (strlen(*str)) {
+		*str += strlen(*str);
+		return s;
+	}
+
+	return NULL;
+}
+
 /* Test if the doubles are close enough to be considered equal */
 static int _close_enough(double d1, double d2)
 {
-- 
2.9.3
