Message-ID: <XFMail.20020822195818.cfreeze@alumni.clemson.edu>
MIME-Version: 1.0
Content-Type: multipart/signed;
 boundary="_=XFMail.1.5.3.Linux:20020822195818:10266=_";
 micalg=pgp-md5; protocol="application/pgp-signature"
In-Reply-To: <20020822174612.GA8692@grimlock>
From: Chris Freeze <cfreeze@alumni.clemson.edu>
Subject: Re: [linux-lvm] vg_read_with_pv_and_lv error
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
Date: Thu Aug 22 19:59:02 2002
List-Id: <linux-lvm.redhat.com>
To: Adam McDaniel <adamm@array.org>
Cc: linux-lvm@sistina.com

This message is in MIME format
--_=XFMail.1.5.3.Linux:20020822195818:10266=_
Content-Type: text/plain; charset=us-ascii


On 22-Aug-2002 Adam McDaniel wrote:

> This is the exact same problem I had last week. So far I've been
> trying to hack in a solution by modifying the PV-UUID (which was
> lost).. with minimal success.
> 
> Let me know if you find a way to fix this, vice-versa :)

I was actually able to restore my lvm drive.  The first thing I did was pull
the backup from the weekend and tar up the /dev/diskvg and /etc/lvm* files. 
After moving them over to my server and unpacking them, I was able to run
vgscan -f -v.  That brought everything back into sync again so that I could
vgchange -ay diskvg and mount.  Thank goodness that I had a system level backup
over the weekend.


-- 
Regards,

Chris

QOTD:
        Money isn't everything, but at least it keeps the kids in touch.

-----
Chris Freeze           Email: cfreeze@alumni.clemson.edu
                         Web: http://www.cfreeze.com 


--_=XFMail.1.5.3.Linux:20020822195818:10266=_
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE9ZYiqpYf63jYRQj8RAh31AJsFg1Fv4oAAa3DiyeayJ0DJiUON8wCfX9+o
1ddhVLoS1u9QAF2XisUCK6A=
=RxV+
-----END PGP SIGNATURE-----

--_=XFMail.1.5.3.Linux:20020822195818:10266=_--
End of MIME message
