Return-Path: <god@cs.auc.dk>
Date: Wed, 17 Jan 2001 12:49:55 +0100
From: Joakim Recht <god@cs.auc.dk>
Subject: Re: [linux-lvm] unable to import vg in 2.4.1pre7
Message-id: <3A6586E3.8010602@cs.auc.dk>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <3A656798.2090603@cs.auc.dk> <3A65843E.9008F7C8@zacarias.com.ar>
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


Gustavo Zacarias wrote:

> Joakim Recht wrote:
>  
> 
>> I wanted to upgrade from 2.4.0pre13 to 2.4.1pre7, so I vgexported my vg,
>> rebooted, installed new tools and tried to vgimport the volume, but this
>> just gives me this error:
>> 
>> vgimport -- ERROR: couldn't create VGDA for imported volume group
>> "volgroups" in kernel
>> 
>> I've used the 0.9.1beta1 tools from cvs and the patch 2.4.1pre7 patch
>> posted here earlier today. Any solution to this?
> 
> 
> Sorry Sorry Sorry!
> Actually the patch i made up, which is a total hack and shouldn't
> trust for more than testing, is based on 0.9 with fixes from cvs.
> Remember, it's NOT offical, and certainly NOT from the LVM people.
> Mea culpa: this happens when i lack caffeine during long periods
> of code tweaking...
> 
I'm perfectly aware of this... It was just the easiest way of patching 
to pre7, as we have almost the same setup. However, if I patch it 
manually (with the vgextend patch), I get the same error, so the 
question is still there.

-- 
Joakim Recht
Tlf. 20 85 54 77
Email god@cs.auc.dk
WWW http://www.braindump.dk / http://www.compuclub.dk
