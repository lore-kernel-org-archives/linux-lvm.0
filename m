Message-ID: <4F26BEAC.8010506@redhat.com>
Date: Mon, 30 Jan 2012 16:00:44 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <c7cbb6bbd7b1bb221f1939dc180f29cd.squirrel@webmail.harte-lyne.ca>
	<a14b2d4dc4f02a1f72c8e26fd7385823.squirrel@webmail.harte-lyne.ca>
In-Reply-To: <a14b2d4dc4f02a1f72c8e26fd7385823.squirrel@webmail.harte-lyne.ca>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Cannot delete lv
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
Cc: "James B. Byrne" <byrnejb@harte-lyne.ca>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01/30/2012 03:57 PM, James B. Byrne wrote:
> 
> As a follow up the lvremove hang produces this in 
> /var/log/messages:
> 
> Jan 30 10:21:58 vhost01 kernel: INFO: task lvremove:1460 blocked
> for more than 120 seconds. Jan 30 10:21:58 vhost01 kernel: "echo 0
> > /proc/sys/kernel/hung_task_timeout_secs" disables this message.

You suspended a device and then issued I/O to it. It will carry on
doing this until you resume the suspended device.

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk8mvqwACgkQ6YSQoMYUY94Z4gCg03oyG2ISLKW5BW8boVJdxPdv
WiEAoNXNWbrUtO1+qJoRUV5XGBcKGodP
=72FE
-----END PGP SIGNATURE-----
