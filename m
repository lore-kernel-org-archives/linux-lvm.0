From: Petr Rockai <prockai@redhat.com>
Subject: [PATCH] Re: [linux-lvm] Clarifications wanted about locking process
References: <7fcd249b0908131713x6aeddd5bm8975df94d3c3a39a@mail.gmail.com>
	<20090814082407.GY7033@agk-dp.fab.redhat.com>
Date: Fri, 14 Aug 2009 13:49:13 +0200
In-Reply-To: <20090814082407.GY7033@agk-dp.fab.redhat.com> (Alasdair
	G. Kergon's message of "Fri, 14 Aug 2009 09:24:07 +0100")
Message-ID: <87my62sjie.fsf_-_@twilight.int.mornfall.net.>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: agk@redhat.com, lvm-devel@redhat.com

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alasdair G Kergon <agk@redhat.com> writes:
> On Thu, Aug 13, 2009 at 08:13:39PM -0400, Eric B=C3=A9langer wrote:
>> Since I updated from lvm2 2.02.48 to 2.02.51, I'm getting this message
>> on boot-up:
>> Write locks are prohibited with --ignorelockingfailure.
>> Unable to obtain global lock.
>=20=20
> Sounds like a bug.
The attached patch should fix the issue. I believe that taking a global wri=
te
lock while scanning is a mistake (I consulted with Milan, he says it only
serves to enable metadata caching).

Yours,
   Petr.


--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline; filename=scanning-read-locks.diff

diff -rN -u -p old-upstream/tools/pvscan.c new-upstream/tools/pvscan.c
--- old-upstream/tools/pvscan.c	2009-08-14 13:44:39.000000000 +0200
+++ new-upstream/tools/pvscan.c	2009-08-14 13:44:40.000000000 +0200
@@ -124,7 +124,7 @@ int pvscan(struct cmd_context *cmd, int 
 			  arg_count(cmd, exported_ARG) ?
 			  "of exported volume group(s)" : "in no volume group");
 
-	if (!lock_vol(cmd, VG_GLOBAL, LCK_VG_WRITE)) {
+	if (!lock_vol(cmd, VG_GLOBAL, LCK_VG_READ)) {
 		log_error("Unable to obtain global lock.");
 		return ECMD_FAILED;
 	}
diff -rN -u -p old-upstream/tools/vgscan.c new-upstream/tools/vgscan.c
--- old-upstream/tools/vgscan.c	2009-08-14 13:44:39.000000000 +0200
+++ new-upstream/tools/vgscan.c	2009-08-14 13:44:40.000000000 +0200
@@ -40,7 +40,7 @@ int vgscan(struct cmd_context *cmd, int 
 		return EINVALID_CMD_LINE;
 	}
 
-	if (!lock_vol(cmd, VG_GLOBAL, LCK_VG_WRITE)) {
+	if (!lock_vol(cmd, VG_GLOBAL, LCK_VG_READ)) {
 		log_error("Unable to obtain global lock.");
 		return ECMD_FAILED;
 	}

--=-=-=--
