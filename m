Message-ID: <3B9E2B66.9030900@st-peter.stw.uni-erlangen.de>
Date: Tue, 11 Sep 2001 17:19:02 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] rc2 problems
References: <20010910132133.F31313@sistina.com> <20010911011612.37371.qmail@web13407.mail.yahoo.com> <20010911162052.E20767@sistina.com>
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

have you tried once more runing
./configure ; PATCHES/make ; and applying the new patch

i think i had the same problem
and that's what worked for me  

Heinz J . Mauelshagen wrote:

>On Mon, Sep 10, 2001 at 06:16:12PM -0700, Pierre Lamb wrote:
>
>>Here is what I did:
>>  Built patch, then applied it I got this
>> it patched various file, next it said it detected a
>>provious patch I said (y) then it wanted to remove a
>>file not detected.
>>
>>Next I did a xconfig selecting LVM. did a make dep
>>then a make clean did a make bzImage, then a make
>>modules ( no errors), then make modules_install there
>>at the en it gave an error :
>>
>>Unsolved sysmbols in (path)lvm-mod.o
>>
>>depmod  lvm_init_fs
>>depmod  lvm_fs_remove.vg
>>depmod  lvm_fin_fs
>>depmod  lvm_fs_remove_lv
>>depmod  lvm_fs_remove_pv
>>depmod  lvm_fs_create_vg
>>depmod  lvm_fs_create_lv
>>depmod  lvm_fs_create_pv
>>
>>know what ???
>>
>
>This looks like "make modules" didn't compile lvm-fs.c and didn't link it
>into lvm-mode.o.
>
>Could you check your "make modules" output in detail, if that's true
>and if you see a reason for this.
>
>Regards,
>Heinz    -- The LVM Guy --
>
>
>>Pierre
>>
>>
>>--- "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
>>wrote:
>>
>>>On Fri, Sep 07, 2001 at 06:07:38AM -0700, Pierre
>>>Lamb wrote:
>>>
>>>>Well I got rh 2.4.7 made the rc2 patches and
>>>>
>>>patched
>>>
>>>>the kernel. No errors, complied the kernel,
>>>>
>>>modules,
>>>
>>>>and installed the modules. All with no errors.
>>>>
>>>Upon
>>>
>>>>booting the lvm-mod modules doesn't load so I did
>>>>
>>>a
>>>
>>>>insmod on lvm-mod and get errors about
>>>>
>>>non-resloved
>>>
>>>>symbols,  What to do next????
>>>>
>>>Could you send what symbols are non resolved?
>>>
>>>>PIerre
>>>>
>>>>__________________________________________________
>>>>Do You Yahoo!?
>>>>Get email alerts & NEW webcam video instant
>>>>
>>>messaging with Yahoo! Messenger
>>>
>>>>http://im.yahoo.com
>>>>
>>>>_______________________________________________
>>>>linux-lvm mailing list
>>>>linux-lvm@sistina.com
>>>>
>>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>>
>>>>read the LVM HOW-TO at
>>>>
>>>http://www.sistina.com/lvm/Pages/howto.html
>>>
>>>-- 
>>>
>>>Regards,
>>>Heinz    -- The LVM Guy --
>>>
>>>*** Software bugs are stupid.
>>>    Nevertheless it needs not so stupid people to
>>>solve them ***
>>>
>>>_______________________________________________
>>>linux-lvm mailing list
>>>linux-lvm@sistina.com
>>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>>read the LVM HOW-TO at
>>>
>>http://www.sistina.com/lvm/Pages/howto.html
>>
>>
>>
>>__________________________________________________
>>Do You Yahoo!?
>>Get email alerts & NEW webcam video instant messaging with Yahoo! Messenger
>>http://im.yahoo.com
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@sistina.com
>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>>
>
>*** Software bugs are stupid.
>    Nevertheless it needs not so stupid people to solve them ***
>
>=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
>Heinz Mauelshagen                                 Sistina Software Inc.
>Senior Consultant/Developer                       Am Sonnenhang 11
>                                                  56242 Marienrachdorf
>                                                  Germany
>Mauelshagen@Sistina.com                           +49 2626 141200
>                                                       FAX 924446
>=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
