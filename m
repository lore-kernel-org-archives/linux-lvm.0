Message-Id: <25E4CA13D679FF48BC307694202209710164DEC1@nd1-clusa.local.bunnings.com.au>
From: Colin Coe <CCoe@bunnings.com.au>
MIME-Version: 1.0
Subject: [linux-lvm] hmmm, curious...
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
Date: Wed Jan 30 19:12:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi all, I have come accross a strange problem while doing some scripting
with lvdisplay.  When I use lvdisplay piped to awk in the first example
(noting that I have 'hard-wired' one field in awk), a second line is printed
containing all hard-wired strings, including tabs.  But if I encase the
lvdisplay in backticks and use echo then piped to awk the problem does not
exist.

[root@linux-lvm bin]# lvdisplay -c /dev/rootvg/bbs | awk -F: '{print $1
"\t\t" $9 "\t" $9 "\t" "2" "\t" $4 }'
/dev/rootvg/bbs         16      16      2       1
                                2

[root@linux-lvm bin]# echo `lvdisplay -c /dev/rootvg/bbs` | awk -F: '{print
$1 "\t\t" $9 "\t" $9 "\t" "2" "\t" $4 }'
/dev/rootvg/bbs         16      16      2       1

I have tried using sed to strip out newline characters, but this has not
helped.  lvdisplay -c /dev/rootvg/bbs | awk -F: '{print $1 "\t\t" $9 "\t" $9
"\t" "2" "\t" $4 }' | sed "s/\n/ /g"

I have a work around so it is not a major issue, but I thought I'd raise it
anyway.

Thanks


Colin Coe
Systems Administrator
Bunnings Building Supplies Pty Ltd



**************************************************************************
Bunnings Legal Disclaimer: 

1) 	This document is confidential and may contain legally privileged 
	information. If you are not the intended recipient you must not 
	read, copy, distribute or act in reliance on it.
	If you have received this document in error, please telephone
	us immediately on (08) 9365-1555. 

2)	All e-mails sent to and sent from Bunnings Building Supplies are
	scanned for content. Any material deemed to contain inappropriate
	subject matter will be reported to the e-mail administrator of
	all parties concerned.

**************************************************************************
