Message-Id: <E04CF3F88ACBD5119EFE00508BBB2121026DCB00@exch-01.noida.hcltech.com>
From: "Chitaranjan Behera, Noida" <cbehera@noida.hcltech.com>
MIME-Version: 1.0
Subject: [linux-lvm] lvextend-lvreduce
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
Date: Wed Apr 24 02:17:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I tried to do lvextend and then lvreduce (same space) without unmounting the
file system, bcoz of online read/write operation on that file system. System
seems slow (almost hanged). So can anybody please tell me whether the SAME
extended block is reduced by the lvreduce command or not. And what could be
the reason of system hang.
  
--
Regards,
Chitaranjan
91-4510701/02   Ext -3159

" Make sincerity and innocence as your real strengths !! "
--
Disclaimer
This document is intended for transmission to the named recipient only.  If
you are not that person, you should note that legal rights reside in this
document and you are not authorized to access, read, disclose, copy, use or
otherwise deal with it and any such actions are prohibited and may be
unlawful. The views expressed in this document are not necessarily those of
HCL Technologies Ltd. Notice is hereby given that no representation,
contract or other binding obligation shall be created by this e-mail, which
must be interpreted accordingly. Any representations, contractual rights or
obligations shall be separately communicated in writing and signed in the
original by a duly authorized officer of the relevant company.
--
