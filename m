Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sBFLsMtO007850
	for <linux-lvm@redhat.com>; Mon, 15 Dec 2014 16:54:22 -0500
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sBFLsKeV009957
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 15 Dec 2014 16:54:20 -0500
Received: by mail-qa0-f47.google.com with SMTP id s7so8785945qap.34
	for <linux-lvm@redhat.com>; Mon, 15 Dec 2014 13:54:20 -0800 (PST)
Sender: Phillip Susi <phillsusi@gmail.com>
Message-ID: <548F5877.1030507@ubuntu.com>
Date: Mon, 15 Dec 2014 16:53:59 -0500
From: Phillip Susi <psusi@ubuntu.com>
MIME-Version: 1.0
References: <5480E939.3070702@ubuntu.com>	<CADxRZqxjvrp3MhW4rAxaBvxeJ7qev=KE=0H92rNcKGBAD1VMaA@mail.gmail.com>	<5484C5A7.8080601@ubuntu.com>	<CADxRZqyi7Ybowtm8YXErwZY7o3NjSi7XELBSnp8xk0mKo4vOOw@mail.gmail.com>	<op.xqkhx9gjae9kta@comodus>
	<5488F019.80805@ubuntu.com>
In-Reply-To: <5488F019.80805@ubuntu.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Raid1 -> linear conversion = destroyed data
Reply-To: psusi@ubuntu.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
Cc: Anatoly Pugachev <matorola@gmail.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12/10/2014 8:15 PM, Phillip Susi wrote:
> On 12/08/2014 03:59 PM, Jason Warr wrote:
>> I may have missed part of the discussion but in order to fully 
>> understand what is going on I'd like to know what arguments you 
>> used when you issued the "lvconvert --splitmirrors" command.
>> There are several options to it that can influence what happens
>> to the mirror members.
> 
> The exact sequence of commands was:
> 
> lvconvert --type raid1 -m 1 faldara/utopic /dev/sdb1 lvconvert
> --splitmirrors 1 --trackchanges faldara/utopic --name utopic-backup
> /dev/md0 lvconvert --splitmirrors 1 --trackchanges faldara/utopic
> --name utopic-backup /dev/md0
> 
> The idea was to start using the new drive exclusively while keeping
> a backup on the old drive.

So is this on someone's radar now as a critical bug?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (MingW32)

iQEcBAEBAgAGBQJUj1h3AAoJENRVrw2cjl5R+DgIAJcR5QNzTboHJBxeKvo1MHoV
Cc+BgMDoyfC0CPiBqMWUC0cFoKUf5nino1uHAlEFUvljmlJqFb4QtoAvRm+DEmcy
h6HnhldPygYPHcjR4el+wq4Jz06Qy0v21OnqcHg9ECoYYmZqqiV3jMYEK1MU4iLU
PczK7Mkdwfn0Uj3sUgmFeXHXHe0jI+zG9D8pQsU3hmImlruT0gy5JOkEI6inRoAO
1ClmWrOSZkoCJO8N22NSNgHn2bgaFBkZubfJ8UL1Frwwh1n9zt/hfs+7qOH1mvDo
Q2CZzuDil+MPVGOHjk6eZZ6hW7zMqRVOoQVwcFrZlF1KQIgMcIGAFb+btNqsTxw=
=0hJ5
-----END PGP SIGNATURE-----
