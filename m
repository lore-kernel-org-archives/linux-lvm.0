Message-ID: <4FBA048D.1030202@redhat.com>
Date: Mon, 21 May 2012 10:02:05 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <CAGQjrKb6_HuVc2Ro8vnkMwEmHg-H4gJHJVf_Q5GVaZfSM1p7yA@mail.gmail.com>
	<20120517181350.2922a70b@bettercgi.com>
	<4FB623AC.9060900@redhat.com>
	<CAGQjrKYrgcx+y8M6NnLGZK5Z+hNpH3Fp4E2EysnKGZuObaFuBA@mail.gmail.com>
	<20120519231404.GF3867@bitfolk.com>
	<CAGQjrKaWT_LnjxbEE57-Mxhn+n+KSvHEGUwC7wapQ7S9Dcb-aA@mail.gmail.com>
In-Reply-To: <CAGQjrKaWT_LnjxbEE57-Mxhn+n+KSvHEGUwC7wapQ7S9Dcb-aA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvreduce nightmare
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: tariq wali <ganaiwali@gmail.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/20/2012 09:59 AM, tariq wali wrote:
> Hi Andy,
> 
> Thanks for the mail.
> 
> I am not sure if reducing by lvreduce alone is safe and will
> actually reduce the underneath file system also, look at this
> sequence ..

It will if you specify -r/--resizefs. This will call the fsadm script
appropriately to perform the same resize on the file system itself
(either before or after, depending on whether you are shrinking or
growing).

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk+6BI0ACgkQ6YSQoMYUY96QoACbBY/kXAMhYx4el1LKi5/0pI6S
xrAAoJhIktgoSrxVfoPBMrtS0Ki5MhB+
=yRht
-----END PGP SIGNATURE-----
