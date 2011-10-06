Message-ID: <4E8D9D8F.80405@redhat.com>
Date: Thu, 06 Oct 2011 14:22:39 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAEKyG25Sx6_Q+=ATCemR1N_Krtq1HYv1no82NXRM8mUD1rQrSQ@mail.gmail.com>
In-Reply-To: <CAEKyG25Sx6_Q+=ATCemR1N_Krtq1HYv1no82NXRM8mUD1rQrSQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM Mirror Failure Detection
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
Cc: Richard Turner <richard.turner83@gmail.com>

Dne 3.10.2011 23:10, Richard Turner napsal(a):
> HIi
> 
> I am trying to setup LVM Mirroring on a Ubuntu 11.04 system and I'm not
> having any luck getting the mirror failure detection working.
> 
> I have downloaded and compiled LVM from source (v2.2.02.88) and installed
> dmeventd but still monitoring doesn't seem to work, when a mirror leg
> failure occurs and I try to copy data to the LV the prompt just hangs
> indefinitely with no mention of the problem anywhere.
> 
> There is no indication anywhere that mirror failure monitoring shouldn't
> work but I did notice that I don't have the
> 'libdevmapper-event-lvm2mirror.so' module anywhere on my system even after
> installing from source, am I missing something or is this functionality not
> yet available?

Haven't you forget --enable-dmeventd ?

Also make sure lvm.conf has proper referent on dmeventd binary
and 'activation/monitoring = 1' or you activate with monitoring (which you
could check via 'ps' if you will find dmeventd task running on your system,
after activation of some mirror).

Zdenek
