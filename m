Date: Tue, 11 Apr 2000 10:43:46 +0200
From: Jens Bruckmann <JBruckmann@comlineag.de>
Reply-To: Jens Bruckmann <JBruckmann@comlineag.de>
Message-ID: <2447.000411@comlineag.de>
Subject: Re[2]: [linux-lvm] lvm'ing root fs
In-reply-To: <38F2C2BB.BE0AD186@twc.de>
References: <38F2C2BB.BE0AD186@twc.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hello all,

UB> tar clCf sourcedir - . | tar xvpCf destdir -

next decision:
I used cpio for this:

find /sourcedir -print | cpio -pvumdl /destdir

Bye,
    Jens Bruckmann
