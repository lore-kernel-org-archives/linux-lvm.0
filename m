Message-ID: <3CFD2513.7040108@st-peter.stw.uni-erlangen.de>
From: Svetoslav Slavtchev <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Anyone with LVM, XFS, Grub?
References: <20020604180234.J8663@babbage.hcsd.de> <1023221351.7927.41.camel@UberGeek> <20020604221717.L8663@babbage.hcsd.de>
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
Date: Tue Jun  4 15:36:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Stephan Austermuehle wrote:

>On Tue, Jun 04, 2002 at 03:09:11PM -0500, Austin Gonyou wrote:
>
>  
>
>>I thinkn there is a patch for this..but I don't, and probably *wont*
>>do this ever.
>>    
>>
>
>I do not like initrd. So I'm searching for a way that allows booting
>the system without initrd. Maybe I worked too much with non x86
>systems...
>
>Stephan
>
>  
>
lvm can not detect the volumes without the tools ( in the initrd )
you should may be take a look at evms.sf.net
they have a patch for lilo but AFAIK they don't have plans for grub

svetljo
