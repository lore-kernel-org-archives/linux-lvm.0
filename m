Message-Id: <3255.200.158.98.53.1018997206.squirrel@www.dokbua.com>
Subject: Re: [linux-lvm] kernel: invalidate: busy buffer
From: "Rene @ Webscorpion.com" <rene.madsen@webscorpion.com>
In-Reply-To: <20020416163659.GA19531@balu.kawo2.rwth-aachen.de>
References: <20020416163659.GA19531@balu.kawo2.rwth-aachen.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Tue Apr 16 17:45:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hm. This is getting interesting:

I installed the 1.1rc1 tools, skipped the patching, and guess what:

Seems to work perfectly.

Not a single error, not a core dump .... I'm just a little worried about
the "beta quality software" sticker on it.  Any experiences with this
version? Should I take a chance and use it anyway?


> On Tue, Apr 16, 2002 at 01:02:40PM -0300, Rene @ Webscorpion.com wrote:
>>
>> LVM tools are 1.0.3 - but as I said, I was unable to run the patch
>> against my kernel source -- and I need and -AC kernel to keep aquote
>> happy.
>
> At least there's a non-AC-Patch for quota 2 (i guess that's what you
> mean with "aquote"). I'm using it here on a Redhat System with a custom
> kernel.
>
> ftp://ftp.suse.com/pub/people/mason/patches/reiserfs/
>
> There are patches for adding Quota to ReiserFS which also need Quota 2
> to work, so the V2 Quota patch is included.
>
> Regards, Markus
>
> --
> Kostenloses MySQL Datenbank-Hosting:
> http://www.google.com/search?q=welcome+to+phpmyadmin
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
