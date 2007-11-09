Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id lA9GVsrt020376
	for <linux-lvm@redhat.com>; Fri, 9 Nov 2007 11:31:54 -0500
Message-ID: <47348A23.3040007@redhat.com>
Date: Fri, 09 Nov 2007 16:26:11 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] EXCEPT option is not working in /etc/hosts.allow
References: <36110.61.8.131.123.1194625395.squirrel@webmail.nhindia.com>
In-Reply-To: <36110.61.8.131.123.1194625395.squirrel@webmail.nhindia.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

bhagwat swarup wrote:
> Hi all
> I configure vsftpd on RHEL5 and use tcp_wrapers security
> My /etc/hosts.allow
> vsftpd : .example.com EXCEPT server1.example.com
> /etc/hosts.deny is empty.
> 
> according to this all hosts of example.com domain are allowed to use
> vsftpd except server1.example.com ,But it not working like this ,it
> allowed all example.com domain and server1.example.com also.
> 

Hi Bhagwat,

This mailing list is for discussion & development of Linux LVM - the
Linux Logical Volume Manager (a way to manage storage devices under Linux).

You'd probably be better off asking your question on a list dedicated to
discussing tcp_wrappers, or one of the general RHEL or Fedora discussion
lists.

Kind regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHNIoj6YSQoMYUY94RAiKKAJ9hPXrzqxHxOPgohxeeoqq5FP545ACgzBu1
OuNwlVsLryODXT4UJRuh8xs=
=FCwe
-----END PGP SIGNATURE-----
