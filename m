Return-Path: <god@cs.auc.dk>
Date: Wed, 17 Jan 2001 10:36:24 +0100
From: Joakim Recht <god@cs.auc.dk>
Message-id: <3A656798.2090603@cs.auc.dk>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Subject: [linux-lvm] unable to import vg in 2.4.1pre7
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

hi

I wanted to upgrade from 2.4.0pre13 to 2.4.1pre7, so I vgexported my vg, 
rebooted, installed new tools and tried to vgimport the volume, but this 
just gives me this error:

vgimport -- ERROR: couldn't create VGDA for imported volume group 
"volgroups" in kernel

I've used the 0.9.1beta1 tools from cvs and the patch 2.4.1pre7 patch 
posted here earlier today. Any solution to this?

-- 
Joakim Recht
Tlf. 20 85 54 77
Email god@cs.auc.dk
WWW http://www.braindump.dk / http://www.compuclub.dk
