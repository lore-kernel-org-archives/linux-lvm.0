Message-ID: <3DAD6971.3040305@ednet.ns.ca>
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm on linux RAID5?
References: <1034773372.1658.8.camel@frodo.xelin.se>
In-Reply-To: <1034773372.1658.8.camel@frodo.xelin.se>
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
Date: Wed Oct 16 08:57:19 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Anders,

That should work. I run LVM on top of one raid5 device but I don't see 
why it wouldn't work over 4 of them.

For example run pvcreate on /dev/sda, then /dev/sdb, etc..

What kind of machine did you manage to get 4 RAID5 arrays into?



Anders Henriksson wrote:

> Hej,
>
> I have tried scanning the list archive and re-read the documentation but
> still....
>
> I want to run lvm over four linux raid5 devices, can I just treat the
> raid devices as discs? i.e. run pvcreate on them directly and go on from
> there.
>
> I am running a linux 7.3 server almost out of the box.
>
> /Anders
>
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
