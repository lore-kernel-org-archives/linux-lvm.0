From: "Stephen C. Tweedie" <sct@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <14120.63828.329938.463291@dukat.scot.redhat.com>
Date: Fri, 30 Apr 1999 01:29:08 +0100 (BST)
Subject: Re: [linux-lvm] Raw/Cahr devices
In-Reply-To: <99Apr27.101317cdt.28406@firewall.sigg.com>
References: <99Apr27.101317cdt.28406@firewall.sigg.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Chris Anderson <chris@alwan.com>
Cc: linux-lvm@msede.com, Stephen Tweedie <sct@redhat.com>

Hi,

On Tue, 27 Apr 1999 10:22:50 -0500, Chris Anderson <chris@alwan.com>
said:

> Can lvm create a Raw/Char devices?

The current raw device patches will let you make character devices for
_any_ block device, including LVM devices.  

--Stephen
