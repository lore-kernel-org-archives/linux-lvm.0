Message-ID: <3E491344.9DE497ED@hp.com>
From: Bird Chen <bird.chen@hp.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Linux Redhat with VA7100
References: <GOENKHMBHNNLADCFEFBAMEBHCAAA.karima_okirim@mail.rtialgerie.com>
Content-Transfer-Encoding: 7bit
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
Date: Tue Feb 11 09:15:05 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,
  Here is the experience from my colleague who has successfully connect the
VA7100 to the linux server, but not IA64 box.
  Recompile your kernel, and remember to check the "probe all luns" in the
SCSI sections. It should fix your problem.

Bird Chen

aicha okirim wrote:

> hello,
>
> how i can see all luns on Linux RedHat 7.2 to HP9000 RX6410 Intel-Itanium?
>
> i can define 02 luns but i can see only one, WHY?
>
> thanks
>
> Aicha Okirim
> RTI Algerie
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--
Bird Chen
Personal Key:0BAD AC36 4C98 9495 3A2E  126A 0925 EA4C 702C CEFC
