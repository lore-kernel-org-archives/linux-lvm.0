From: Jason Smith <jhs@openenterprise.biz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200302132047.13938.jhs@openenterprise.biz>
Subject: [linux-lvm] Available snapshot chunks known in LVM2
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Feb 13 08:40:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@sistina.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi.

I am trying to implement a script that will automagically grow a snapshot=20
volume if it is getting too full, using 2.4.20-dm-7 and the latest stable=20
LVM2 and libdevmapper.

My problem is that the integer percent full value is not precise enough: on=
=20
for example a 100GB volume, those increments of course only tell me my=20
snapshot usage down to 1GB, and my ultimate goal is to put off reallocating=
=20
as long as possible, so I need to see this number down to, say, a 100MB=20
granularity.  Also, the current implementation rounds down, so 99.97% could=
=20
be interpreted as 1GB free in this example.  So I spent the last couple of=
=20
hours learning LVM code and implementing this change.

My first attempt worked!  But I'm not sure it's the best approach.  Basical=
ly=20
these are the changes necessary:
In device-mapper:
1) modify struct exception_store to include two new methods; one returns=20
chunks used, the other the total chunks
2) implement them in dm-exception-store.c
3) modify snapshot_status() to snprintf the percentage (as original), but t=
o=20
append the used and total chunks from the said functions (this is backward=
=20
compatible with current LVM userland functionality)

In LVM2:
1) Change dev_manager_snapshot_percent() to grab the appended "used" and=20
"total size" values from dm
2) Modify lv_snapshot_percent() to calculate the percentage instead.  Actua=
lly=20
when I did it this way, I got a little win because the percentage is an=20
actual float, and not a type conversion from the dm's int.  (Although maybe=
 a=20
simpler fix would be just to make persistent_percentfull return float like=
=20
any function named "percentfull" should!)
3) Actually at this point, I was log_print()ing for debugging purposes so m=
y=20
proof-of-concept script just greps it out of the output at this time.

Thoughts?  IMO, firstly, the percentage full is certainly a number only=20
interesting to users (or rather userland), so why is it getting calculated =
in=20
the kernel?  Secondly, my script and any similar daemon, etc. would just be=
=20
pulling the data back out of that fraction anyway to get a clearer picture,=
=20
so why not just return it from the kernel?  Anyway, my changes fixed both=20
problems.  I'd be happy to send diffs, BTW.

Thanks.

=2D --=20
Jason Smith
Open Enterprise Systems
Bangkok, Thailand
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+S6Hfm5qEoSbpT3kRAuQ3AJ9KNw4swX49SFda96gJVT08bChsrgCdFpdb
fVNsVMBkX/yQRuzPhTwaLNA=3D
=3DH4M7
=2D----END PGP SIGNATURE-----
