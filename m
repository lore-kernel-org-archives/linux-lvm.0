Message-ID: <20010823155132.89178.qmail@web20301.mail.yahoo.com>
Date: Thu, 23 Aug 2001 08:51:32 -0700 (PDT)
From: Brad Langhorst <bwlang@yahoo.com>
Subject: [linux-lvm] segfault running vgscan 
MIME-Version: 1.0
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

>Brad,
>
>does it still segfault if you create a volume group
>before?
>
>On Wed, Aug 22, 2001 at 06:10:53PM -0700, Brad
>Langhorst wrote:
>> I've carefully followed the instructions in INSTALL
>> and the build seems to go fine.
>>...
vgcreate also segfaults 
it seems clear to me that this is a build problem not
a code bug since almost everything segfaults

pvdisplay and pvscan do not segfault
all other pv commands and all vg commands segfault

brad


__________________________________________________
Do You Yahoo!?
Make international calls for as low as $.04/minute with Yahoo! Messenger
http://phonecard.yahoo.com/
