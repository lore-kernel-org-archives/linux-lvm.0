Message-ID: <51DB9939.7010803@redhat.com>
Date: Tue, 09 Jul 2013 07:01:45 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <CAKAA-nmORsWxeOX1O0Hnv6nFx_1nM41CUULk15biAfuderXmGg@mail.gmail.com>
In-Reply-To: <CAKAA-nmORsWxeOX1O0Hnv6nFx_1nM41CUULk15biAfuderXmGg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Micky <mickylmartin@gmail.com>

On 07/09/2013 03:37 AM, Micky wrote:
> On a machine, where weekly snapshots are created for dumping raw data,
> the overall disk i/o has drastically degraded to few megabytes per
> second. It is quite random and so slow that commands freeze often.
>
> I was using chunk size of 512K and same byte size with dd.
>
> Is it quite common; I read that such freezes require a reboot. Is
> there a way to avert?
> What am I missing here?

What do you mean by weekly snapshots?
If you mean old-style snapshots not thin-ones, many snapshots with 
single origin LV then how many snapshots are you keeping around?

If you have N snapshots up to (N+1)*chunksize is written for every write.

Also if this setup is used on HDDs the seektime may be relevant as well.

Old style snapshots were not meant for long term use and should be used 
while snapshot is copied over to permanent location.

You may be better off using thin-snapshots. Otherwise the solution is 
dumping old snapshots or moving over to tape, whatever, just do not keep 
more of them.

-- Marian

>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
