Message-ID: <3B955F58.9080802@st-peter.stw.uni-erlangen.de>
Date: Wed, 05 Sep 2001 01:10:16 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] rh kernel patches
References: <20010904204402.63949.qmail@web13408.mail.yahoo.com>
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

you alredy have lvm-0.9beta2 wich comes with kernel-2.4
you shouldn't downgrade to 0.8 try the LVM-1.0-release
untar it, run configure in the toplevel LVM directory , than go to 
PATCHES and do make
you should have lvm-1.0.patch for your kernel in the directory
and patch the kernel
cat linux-2.4.7rh-lvm-1.0.patch | patch -p1 -d /usr/src/linux
                 |                                                       
           |
     here is your kernel patch                           and that's the 
path to your kernel


rebuild the kernel and it should be allright
if duiring the rebuild you have some problems with building the lvm part 
of the kernel

run ones more configure , in PATCHES make ,
cat linux-2.4.7rh-lvm-1.0.patch | patch -p1 -d /usr/src/linux

and that's it
you shouldn't have more troubles

make the lvm library and binaries and install them




Pierre Lamb wrote:

>Yes I am I thought the "lvm-0.8..." could be applied
>with the patch command to the kernel, I gues I am
>incorrect.
>
>Pierre
>--- Joe Thornber <thornber@btconnect.com> wrote:
>
>>On Tue, Sep 04, 2001 at 12:25:13PM -0700, Pierre
>>Lamb wrote:
>>
>>>I quess I don't understand the whole picture. From
>>>
>>the
>>
>>>/PATCHES/readme file I was lead to believe all I
>>>
>>need
>>
>>>to to id use the patch file labeled
>>>"lvm-0.8final-2.4.0.patch" and apply it to the rh
>>>kernel 2.4.7.  Am I mistaken???? PLease provide
>>>guidance..
>>>
>>Which release of the tools are you looking at ? 
>>1.0.1-rc2 I hope ?
>>
>>- Joe
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@sistina.com
>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at
>>
>http://www.sistina.com/lvm/Pages/howto.html
>
>
>__________________________________________________
>Do You Yahoo!?
>Get email alerts & NEW webcam video instant messaging with Yahoo! Messenger
>http://im.yahoo.com
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
