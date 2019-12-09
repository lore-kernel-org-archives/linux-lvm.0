References: <D2CA32A7-3D9D-4490-9B42-89DC00E163FE@gmail.com>
	<8B290F6D-9D0B-4186-9F17-AAAB0BFA8DDA@gmail.com>
	<9ce05dc0-25f9-cf62-3d7d-3911a7df90ea@redhat.com>
	<EE5C3FCA-1A0B-4518-927D-5108F109F5AA@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <8489c3df-e12a-f343-212b-20b2f898b642@redhat.com>
Date: Mon, 9 Dec 2019 14:59:32 +0100
MIME-Version: 1.0
In-Reply-To: <EE5C3FCA-1A0B-4518-927D-5108F109F5AA@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Thin pool vg1-thinpool1-tpool (253:3)
 transaction_id is 549, while expected 505.
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?Q?=c5=81ukasz_Czerpak?= <lukasz.czerpak@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 09. 12. 19 v 14:50 Łukasz Czerpak napsal(a):
> hi,
> 
> It’s Ubuntu 18.04.3:
> 
> $ lvm version
>    LVM version:     2.02.176(2) (2017-11-03)
>    Library version: 1.02.145 (2017-11-03)
>    Driver version:  4.37.0
> 
> $ uname -a
> Linux gandalf 4.15.0-72-generic #81-Ubuntu SMP Tue Nov 26 12:20:02 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
> 
> It’s weird as same error occurred few minutes ago. I wanted to take snapshot of thin volume and it first returned the following error:
> 
> $ lvcreate -s --name vmail-data-snapshot vg1/vmail-data
> Using default stripesize 64.00 KiB.
> Can't create snapshot vmail-data-snapshot as origin vmail-data is not suspended.
> Failed to suspend thin snapshot origin vg1/vmail-data.
> 
> Then I tried with different volume:
> 
> $ lvcreate -s --name owncloud-data-snapshot vg1/owncloud-data
> Using default stripesize 64.00 KiB.
> Thin pool vg1-thinpool1-tpool (253:2) transaction_id is 574, while expected 572.
> Failed to suspend vg1/thinpool1 with queued messages.
> 
> Same error when then tried to export LXD’s container:
> 

Hi

While I'd highly recommend to move to kernel 4.20 (at least) - from name of 
your volumes - it does look like you are using thinp in some 'cloud' environment.

For thin-pool it's critically important to always have thin-pool active only 
on a single machine.  You must never run thin-pool activate on multiple 
machines (even if one machine is not using it - but just has it active).

So we have seen already many times user have actived thin-pool on their host 
machines and then passed devices into virtual machines and used there the same 
thin-pool (so thin-pool has been activate multiple times at the same time).

So please carefully check if this is not your case - as this would nicely 
explain why your 'transaction_id' got so much different.

Regards

Zdenek
