Message-Id: <3C57354D.1070601@birddog.com>
From: "Kirby C. Bohling" <kbohling@birddog.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] software RAID over LVM
References: <20020129233717.14970.qmail@mailshell.com>
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
Date: Tue Jan 29 17:53:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Paul,

	I haven't done it.  I have done mirrors underneath, but I am curious what 
is the reasoning and/or application.  The only thing I can think up is 
so you can migrate your mirrors to faster drives easily.  However, 
putting the mirror underneath should allow you to move off one mirror 
onto another.

	I don't believe that mirroring can be expanded like a filesystem can.  In 
order to make the mirror bigger, you have to break the mirror as far as 
I know.  So what are you planning on doing with it, or is it just "to 
see if it could be done".

	Thanks,
		Kirby

lvm@agilecat.mailshell.com wrote:
> Hi all,
> 
> I understand the use of LVM over software RAID.
> But is it possible to use software RAID ON TOP
> of LVM?  For example, have a RAID-1 mirroring
> array created from two logical volumes.
> 
> I've tried and it seems to be working.  Is
> it safe to do this?  Any pitfalls?
> 
> Thanks!
> 
> Paul
> 
> _______________________________________________________
> The FREE service that prevents junk email http://www.mailshell.com
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
