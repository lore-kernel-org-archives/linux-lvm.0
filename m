Date: Mon, 26 Jul 1999 21:52:58 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] RAID and LVM?
In-Reply-To: <Pine.LNX.3.96.990726222206.21028A-100000@chiara.csoma.elte.hu>
Message-ID: <Pine.LNX.4.10.9907262148160.14960-100000@hibernia.spin.ie>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@chiara.csoma.elte.hu>
Cc: Luca Berra <bluca@comedia.it>, linux-lvm@msede.de, bluca@colombina.comedia.it, linux-lvm@msede.com

On Mon, 26 Jul 1999, Ingo Molnar wrote:

  
  On Mon, 26 Jul 1999, Paul Jakma wrote:
  
  (rather flame me for it ;) 

ah.. oops.. sorry. How does "Ingo's magic coding fingers" sound? :)

  The new RAID driver will likely not go into
  2.2.11, but into 2.2.12. Anyway, the new RAID 0723 release is much more
  merging-friendly wrt. LVM.

great... by the way would you have any advice about the bh->b_dev,
bh->b_rdev thing. I'm not much of a hacker, but am keen to test. 
  

  > or ideally for raid to be fully integrated into LVM, and create
  > RAID-5 VG's. 
  
  or, considering the relative complexity of the two drivers (and the
  conceptual background), to integrate LVM into the concepts of RAID :) Or
  let them live side by side as now.

lvm into raid sounds good too. imho, layering one on top of the other
isn't optimal. Only integration of the two can be. (whichever way
isn't really important).
  
  -- mingo
  
regards,
-- 
Paul Jakma
paul@clubi.ie	http://hibernia.clubi.ie
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
There is no time like the present for postponing what you ought to be doing.
