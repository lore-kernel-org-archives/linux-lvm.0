From: benr@us.ibm.com
Message-ID: <85256903.007E3595.00@d54mta02.raleigh.ibm.com>
Date: Mon, 19 Jun 2000 18:58:31 -0400
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
	 Community
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Allen <mallen@tuxtops.com>
Cc: linux-lvm@msede.com



Mark,

While I can not talk about IBM's high availability products (different
product group within the company), I can say that high availability was a
consideration in our design, and that it can be handled through plug-ins.

Ben



Mark Allen <mallen@tuxtops.com>@msede.com on 06/16/2000 06:00:46 pm

Sent by:  owner-linux-lvm@msede.com


To:   Ben Rafanello/Austin/IBM@IBMUS
cc:   linux-lvm@msede.com
Subject:  Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
      Community



benr@us.ibm.com wrote:
> Hello everyone.  Sorry for the delay in responding.  Here is something I
> posted to Slashdot.  I think it answers some questions and gives a little
> context for what IBM is doing.  I'll try to begin answering the specific
> questions that have been submitted this afternoon.

I'm really excited that IBM is considering releasing their LVM
technology -- JFS and the LVM were really the best features of AIX by
far.

Could you address the prospect of IBM's LVM incorporating "shared"
volume groups like the commercial high-availablity software (IBM's
HA/CMP or HP's Service Guard or Sun's HA offering).  That kind of
software would allow a disk group to transfer to another system if the
main host failed.

Would something like that be a "feature plug-in" in the framework which
was proposed in the white paper?

Regards,

Mark
