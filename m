Message-ID: <3BEFAF8E.6090204@st-peter.stw.uni-erlangen.de>
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] update version 0.9.1_beta2 -> version 1.0
References: <3BEFACF6.5010606@softing.com>
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
Date: Mon Nov 12 05:15:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi

> i downloaded and installed linux-2.4.14 from linux.org.
> but i can't umount /usr (instruction from README.1st).
>
>
> q.:
> 1. does lvm 1.0 run on kernel 1.4.14 ?

:) i don't think it supports 1.4.14 :)
but there is no problem with 2.4.14 :)

> 2. how to do the installation without umounting /usr ?

well i think you'll have to, you have to patch the kernel, desactivate 
the VG's ,
unload the lvm module and load the newly created , and activate the VG's

> 3. is it possible to upgrade to version 1.0.1-rc4 without first 
> upgrading to version 1.0 ?

no problem

i still can not understand why you can not unmount /usr ?
