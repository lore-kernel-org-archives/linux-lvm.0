Date: Wed, 5 Sep 2001 12:09:41 +0200
From: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Subject: Re: [linux-lvm] LV size maximum
Message-ID: <20010905120941.B19406@lug-owl.de>
References: <20010905113307.A19406@lug-owl.de> <3B95F629.1050909@st-peter.stw.uni-erlangen.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B95F629.1050909@st-peter.stw.uni-erlangen.de>; from galia@st-peter.stw.uni-erlangen.de on Wed, Sep 05, 2001 at 11:53:45AM +0200
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, 2001-09-05 11:53:45 +0200, svetljo <galia@st-peter.stw.uni-erlangen.de>
wrote in message <3B95F629.1050909@st-peter.stw.uni-erlangen.de>:
> Jan-Benedict Glaw wrote:
> > The FAQ tells me (in Q9) something of 2TB, but lvextend INFOs
> > me of a maximum of 1TB. Where's the real limit? My understanding
> > is that limitation is coming from kernel to handle all data
> > in chunks of 512Bytes. Is the maximum number of 512Byte blocks
> > per device to be increased in some time?

> this is a part of the german lvm HOW-TO
> 
> Q: Why can i not have a Logical volume biger than 256Gb ?
> 
>  A:  This is NO absolute limit but it depends on the physical extent 
> size you configured at volume group creation time. Please use option -s 
> of the vgcreate command to give a larger physical extent size. For 
> example with a physical extent size of 524288 KB (512 MB) you are able 
> to map a logical volume of 32 Terabyte. Remember that current Linux 
> kernels are limited to 1 Terabyte.

That doesn't exactly help me. I already know that text. My
problem is that there are mentioned different maximum values
for the size:

FAQ:		2TB on 32bit machines and 512 bytes block size

(Where do you read of 1TB???)

My final question is/was: Is the limit (on kernel's side) to
be raised in some *near* future?

MfG, JBG

-- 
Jan-Benedict Glaw . jbglaw@lug-owl.de . +49-172-7608481
