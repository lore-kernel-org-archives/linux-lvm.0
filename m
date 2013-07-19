Date: Sat, 20 Jul 2013 00:20:53 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20130719232052.GB23574@agk-dp.fab.redhat.com>
References: <51E981EF.3020007@gmail.com> <51E99A85.8060901@redhat.com>
	<51E9BD58.4030301@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51E9BD58.4030301@gmail.com>
Subject: Re: [linux-lvm] pvmove
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Papik <mp6058@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

It uses lists of ranges separated by colons.

  :x-y

If x is missing, 0 is inserted; if y is missing, the last extent on the device
is inserted.

Man pages can always be improved with more examples!

For +length, try the patch below.

Alasdair


--- a/tools/toollib.c
+++ b/tools/toollib.c
@@ -1001,7 +1001,7 @@ static int _parse_pes(struct dm_pool *mem, char *c, struct dm_list *pe_ranges,
 		      const char *pvname, uint32_t size)
 {
 	char *endptr;
-	uint32_t start, end;
+	uint32_t start, end, len;
 
 	/* Default to whole PV */
 	if (!c) {
@@ -1041,7 +1041,16 @@ static int _parse_pes(struct dm_pool *mem, char *c, struct dm_list *pe_ranges,
 					goto error;
 				c = endptr;
 			}
+		} else if (*c == '+') {	/* Length? */
+			c++;
+			if (isdigit(*c)) {
+				if (!xstrtouint32(c, &endptr, 10, &len))
+					goto error;
+				c = endptr;
+				end = start + (len ? (len - 1) : 0);
+			}
 		}
+
 		if (*c && *c != ':')
 			goto error;
 
