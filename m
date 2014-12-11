Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sBB1M9Yx018382
	for <linux-lvm@redhat.com>; Wed, 10 Dec 2014 20:22:09 -0500
Received: from cdptpa-oedge-vip.email.rr.com
	(cdptpa-outbound-snat.email.rr.com [107.14.166.226])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sBB1M7oT008460
	for <linux-lvm@redhat.com>; Wed, 10 Dec 2014 20:22:08 -0500
Message-ID: <5488F019.80805@ubuntu.com>
Date: Wed, 10 Dec 2014 20:15:05 -0500
From: Phillip Susi <psusi@ubuntu.com>
MIME-Version: 1.0
References: <5480E939.3070702@ubuntu.com>	<CADxRZqxjvrp3MhW4rAxaBvxeJ7qev=KE=0H92rNcKGBAD1VMaA@mail.gmail.com>	<5484C5A7.8080601@ubuntu.com>	<CADxRZqyi7Ybowtm8YXErwZY7o3NjSi7XELBSnp8xk0mKo4vOOw@mail.gmail.com>
	<op.xqkhx9gjae9kta@comodus>
In-Reply-To: <op.xqkhx9gjae9kta@comodus>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Raid1 -> linear conversion = destroyed data
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Anatoly Pugachev <matorola@gmail.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

On 12/08/2014 03:59 PM, Jason Warr wrote:
> I may have missed part of the discussion but in order to fully 
> understand what is going on I'd like to know what arguments you
> used when you issued the "lvconvert --splitmirrors" command.  There
> are several options to it that can influence what happens to the
> mirror members.

The exact sequence of commands was:

lvconvert --type raid1 -m 1 faldara/utopic /dev/sdb1
lvconvert --splitmirrors 1 --trackchanges faldara/utopic --name
utopic-backup /dev/md0
lvconvert --splitmirrors 1 --trackchanges faldara/utopic --name
utopic-backup /dev/md0

The idea was to start using the new drive exclusively while keeping a
backup on the old drive.

Also I thought it was a bit odd that --splitmirrors accepted the
- --name argument, but silently ignored it, instead using an internal
auto generated name.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBCgAGBQJUiPAZAAoJENRVrw2cjl5RAS0H/10hFYNUF8n71iXER0iQVAtd
bHauiQBbemml3Q1RgqWHCFj2SYQB0epACFHIdyDUC2kWaNyQ7A9VnbRPsnyEGLzo
Tu2+LjbH2QA1e8J9zHQYq8BO0jHay5n/1S/JZrhUHxW0hyI3vnsVXESNA4GUntqn
tcC7N+wzu8SUIuqjtcm30kEE0ZvzlDv4znADIudJzXJu7JE+TjhIljg5YWY8NBxE
AYbUc1f8tGKzIyzehPETpq6/Hsi4C8C27nw+kugs+HvrmWO29nqhjQczXlbYfvjL
SDNsXLMj68dkjSqJzuuK0jy6HlHgrPxJJtaGfJ92TIcFbm9gVJHWfqClzbd1vao=
=am39
-----END PGP SIGNATURE-----
