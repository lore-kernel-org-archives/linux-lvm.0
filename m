Message-ID: <3B95F629.1050909@st-peter.stw.uni-erlangen.de>
Date: Wed, 05 Sep 2001 11:53:45 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LV size maximum
References: <20010905113307.A19406@lug-owl.de>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com



this is a part of the german lvm HOW-TO

Q: Why can i not have a Logical volume biger than 256Gb ?

 A:  This is NO absolute limit but it depends on the physical extent 
size you configured at volume group creation time. Please use option -s 
of the vgcreate command to give a larger physical extent size. For 
example with a physical extent size of 524288 KB (512 MB) you are able 
to map a logical volume of 32 Terabyte. Remember that current Linux 
kernels are limited to 1 Terabyte.


Jan-Benedict Glaw wrote:

>Hi!
>
>I'm to build some storage pool for an in-company network. It
>will exceed 1TB in some time, so I'd like to get some proper
>information on this *before* I get into trouble:-) So, my
>final question is: How big may an LV be?
>
>The FAQ tells me (in Q9) something of 2TB, but lvextend INFOs
>me of a maximum of 1TB. Where's the real limit? My understanding
>is that limitation is coming from kernel to handle all data
>in chunks of 512Bytes. Is the maximum number of 512Byte blocks
>per device to be increased in some time?
>
>MfG, JBG
>
