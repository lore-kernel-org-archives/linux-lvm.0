Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1BJY0i01454
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2004 14:34:00 -0500
Received: from mail1.treklogic.com (mail1.treklogic.com [207.245.223.251])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1BJXxb16642
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2004 14:33:59 -0500
From: "John" <jzheng@treklogic.com>
Message-ID: <001201c3f0d6$84259930$b708a8c0@treklogic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <4029E4E5.3040306@adelaide.edu.au>
Subject: [linux-lvm] LVM Statistics
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Feb 11 14:33:19 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com
Cc: linux-lvm@sistina.com

hello everyone:

  Is there anyone know about LVM IO statistics, kind of want to trace IO
statistics but from the output lvdisplay -v only shows the frequency of read
and write activities to extend, rather than the actual number of bytes that
been written and read. Any clue that I can get those figure? thanks for
suggestion before i dig into the LVM source code. thanks
