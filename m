Date: Thu, 20 Apr 2000 12:01:42 +0200
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] resizing reiserfs on top of LVM
Message-ID: <20000420120142.A5114@gruyere.muc.suse.de>
References: <20000420111009.A2418@linux-magazin.de>
Mime-Version: 1.0
In-Reply-To: <20000420111009.A2418@linux-magazin.de>; from hm@linux-magazin.de on Thu, Apr 20, 2000 at 11:10:09AM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harald Milz <hm@linux-magazin.de>
Cc: reiser@idiom.com, linux-lvm@msede.com, tw@suse.de, mge@suse.de, afx@suse.de, mm@suse.de

On Thu, Apr 20, 2000 at 11:10:09AM +0200, Harald Milz wrote:
> Hi,
> 
> I am very fond of resizing filesystems on top of LVM (having worked
> with and loving IBM AIX a lot too :-) therefore I wrote a little tool
> to integrate resize_reiserfs and lv{reduce|extend} similar to e2fsadm
> wrote by Tytso.  This is a first approach which works as designed for
> me. Please beat the shit out of it to find design errors, flaws and bugs.

Did you actually try to shrink a FS ? AFAIK resize_reiserfs does not
support it yet (only growing) 


-Andi
