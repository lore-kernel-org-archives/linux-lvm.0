Message-ID: <37C0F433.1A361B6F@ep-ag.com>
Date: Mon, 23 Aug 1999 09:11:47 +0200
From: Klaus Strebel <stb@ep-ag.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM in stock kernel!?
References: <199908212041.AA13662@mailgate1b.telekom.de>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: torvalds@transmeta.com
Cc: linux-lvm@msede.com

Hi Linus,

Heinz Mauelshagen wrote:
> Dirk Hohndel told me last week, that Linus wants to wait before putting LVM
> into the stock kernel to see if enough people are interested to have this.
So, you wanna hear from people who're using LVM on Linux? 

Here, we are! Let's get rid of that damned partitioning fuzz. With LVM i
actually only need three 'partitions' on my boot-drive: root, swap and
my physical volume of lvm. I can create, increase, shrink and drop now
logical volumes just to test new filesystems (is there any gfs guy on
the list? I use Antimatter Ant with patch 3 on a lv and it works great
now!) or other new software. Another evident thing for me is, that i can
use Oracle8's autoextension without fear to fill my root!

So, give everybody his LVM !

Thanks for your great work

Ciao
Klaus
-- 
Klaus Strebel
stb@ep-ag.com
EIGNER + PARTNER AG   - The Engineering Warehouse Company -
<http://www.ep-ag.com>
-----------------------------------------------------------------------
