Return-Path: <gustavo@zacarias.com.ar>
Message-ID: <3A65843E.9008F7C8@zacarias.com.ar>
Date: Wed, 17 Jan 2001 08:38:38 -0300
From: Gustavo Zacarias <gustavo@zacarias.com.ar>
MIME-Version: 1.0
Subject: Re: [linux-lvm] unable to import vg in 2.4.1pre7
References: <3A656798.2090603@cs.auc.dk>
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: god@cs.auc.dk

Joakim Recht wrote:
 
> I wanted to upgrade from 2.4.0pre13 to 2.4.1pre7, so I vgexported my vg,
> rebooted, installed new tools and tried to vgimport the volume, but this
> just gives me this error:
> 
> vgimport -- ERROR: couldn't create VGDA for imported volume group
> "volgroups" in kernel
> 
> I've used the 0.9.1beta1 tools from cvs and the patch 2.4.1pre7 patch
> posted here earlier today. Any solution to this?

Sorry Sorry Sorry!
Actually the patch i made up, which is a total hack and shouldn't
trust for more than testing, is based on 0.9 with fixes from cvs.
Remember, it's NOT offical, and certainly NOT from the LVM people.
Mea culpa: this happens when i lack caffeine during long periods
of code tweaking...

-- 
Gustavo Zacarias - Yahoo! ID "qarnage"
Yahoo! Argentina - http://www.yahoo.com.ar
--
