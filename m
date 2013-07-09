MIME-Version: 1.0
In-Reply-To: <51DB9939.7010803@redhat.com>
References: <CAKAA-nmORsWxeOX1O0Hnv6nFx_1nM41CUULk15biAfuderXmGg@mail.gmail.com>
	<51DB9939.7010803@redhat.com>
Date: Tue, 9 Jul 2013 13:26:51 +0500
Message-ID: <CAKAA-nkx11Pu4qA3zGHSwiFOXkvr9m5yJJynZJ9i2HJ54mEjqQ@mail.gmail.com>
From: Micky <mickylmartin@gmail.com>
Subject: Re: [linux-lvm] Very slow i/o after snapshotting
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
To: Marian Csontos <mcsontos@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

> What do you mean by weekly snapshots?
> If you mean old-style snapshots not thin-ones, many snapshots with single
> origin LV then how many snapshots are you keeping around?

I meant, running lvcreate ---snapshot, copying the data with dd or pv
and then removing the snapshot.

> If you have N snapshots up to (N+1)*chunksize is written for every write.

It is only one snapshot. A fresh one is created and after use, it's removed.

> Also if this setup is used on HDDs the seektime may be relevant as well.
> Old style snapshots were not meant for long term use and should be used
> while snapshot is copied over to permanent location.

Makes sense. But the snapshots exist no more than just few hours for every LV.

> You may be better off using thin-snapshots. Otherwise the solution is
> dumping old snapshots or moving over to tape, whatever, just do not keep
> more of them.

Sounds like not much of an option since I don't have thin pools.
Haven't had much success with them.
