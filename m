Date: Wed, 29 Dec 1999 11:06:22 +0100
From: Fabian Herschel <Fabian.Herschel@suse.de>
Subject: Re: [linux-lvm] lvextend
Message-ID: <19991229110622.A456@suse.de>
References: <Pine.LNX.4.10.9912281058520.1394-100000@scooby.cisco.com>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.10.9912281058520.1394-100000@scooby.cisco.com>; from Adam Crews on Tue, Dec 28, 1999 at 11:09:14AM -0800
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adam Crews <acrews@cisco.com>, linux-lvm@msede.com

Hello,

On Tue, Dec 28, 1999 at 11:09:14AM -0800, Adam Crews wrote:
> Hello,
> 
> I am having problems trying to extend a lv.
> 
> [root@scooby /root]# lvextend -v -l+6514 /dev/mirror_vg/mirror_lv 

Just a question back, do you realy want to extend the lv with 6514 *extentds*? So you would
have a vg with just one lv which allocates the complete space of the vg.
What says lvdisplay /dev/mirror_vg/mirror_lv?
Does lvextend -v -l+6513 /dev/mirror_vg/mirror_lv work? The last line is to test, if there could be an error
in the handling of the last extend.

Greetings Fabian Herschel

-----------------------------------------------------------------------
Fabian Herschel                                 SuSE Rhein/Main AG     
Tel:    +49-6196-50951-23                       Mergenthalerallee 45-47
Fax:    +49-6196-409-607                        D-65760 Eschborn
mailto: Fabian.Herschel@suse.de                 http://www.suse.de      
