Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2N9Ndj22723
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 04:23:39 -0500
Received: from hotmail.com (bay16-dav47.bay16.hotmail.com [65.54.186.227])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2N9NcWA011614
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 04:23:38 -0500
From: "sachin" <sachindurge@hotmail.com>
Date: Tue, 23 Mar 2004 14:59:36 -0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <BAY16-DAV47hYSoOZzH000004bb@hotmail.com>
Subject: [linux-lvm] Thread safeness of the liblvm-10
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

Hi,
I am writting an application using the liblvm-10 library ,Can any one tell
me wether the library
is multithreadsafe or not.  I am not modifying the configuration i am use it
for read only purpose
I am using lvm1
Thanks in advance
Sachin.
