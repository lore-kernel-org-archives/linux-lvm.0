Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2T5Qjj20932
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2004 00:26:45 -0500
Received: from hotmail.com (bay16-dav28.bay16.hotmail.com [65.54.186.208])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2T5Qh1X025107
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2004 00:26:43 -0500
From: "sachin" <sachindurge@hotmail.com>
Date: Mon, 29 Mar 2004 11:02:40 -0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <BAY16-DAV28kO22ZhCl0000884d@hotmail.com>
Subject: [linux-lvm] Extents allocation
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com
Cc: sachin <sachindurge@hotmail.com>

Hi ,
I  have a question related to  lovical extents  to physical  extents mapping
Can any one tell  me is this possible

lv1 LE  1     to  n      map to PE 1-n     of dev1
lv1 LE  n+1 to  m     map to PE 1-x     of dev2
lv1 LE m+1 to  x      map to PE n+1-z of dev1

I want to know this kind of extent allotment is allowed or not
i.e the extents from one pv are followed one after another
I am using LVM1
Thanks in advance
Sachin.
