Subject: Re: [linux-lvm] resizing reiserfs on top of LVM
References: <20000420111009.A2418@linux-magazin.de> <20000420120142.A5114@gruyere.muc.suse.de>
From: Alexander Zarochentcev <zam@odintsovo.comcor.ru>
Date: 20 Apr 2000 20:46:00 +0400
In-Reply-To: "Andi Kleen"'s message of "Thu, 20 Apr 2000 12:01:42 +0200"
Message-ID: <m34s8w67qv.fsf@crimson.comcor.ru>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@suse.de>
Cc: Harald Milz <hm@linux-magazin.de>, reiser@idiom.com, linux-lvm@msede.com, tw@suse.de, mge@suse.de, afx@suse.de, mm@suse.de


 AK> On Thu, Apr 20, 2000 at 11:10:09AM +0200, Harald Milz wrote:
 >> Hi,
 >> 
 >> I am very fond of resizing filesystems on top of LVM (having worked
 >> with and loving IBM AIX a lot too :-) therefore I wrote a little tool
 >> to integrate resize_reiserfs and lv{reduce|extend} similar to e2fsadm
 >> wrote by Tytso.  This is a first approach which works as designed for
 >> me. Please beat the shit out of it to find design errors, flaws and bugs.

 AK> Did you actually try to shrink a FS ? AFAIK resize_reiserfs does not
 AK> support it yet (only growing) 

The resize_reiserfs supports off-line shrinking since 3.5.19. This is still
APLHA version of fs shrinker.  

 AK> -Andi

Best regards, 
        Alex.
-- 
Alexander Zarochentcev, mailto:zam@odintsovo.comcor.ru
