Return-Path: <kishore.sampathkumar@wipro.com>
From: Kishore <kishore.sampathkumar@wipro.com>
Message-Id: <200103060710.MAA08060@wipro.wipsys.sequent.com>
Date: Tue, 6 Mar 2001 12:40:45 +0530 (IST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Where is the limit on Max VGs coming from?
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

Hi,

I wanted to know the reason for the limitation for Maximum number of
VGs, which is 100 currently.

If it was based on bits in minor number, I was under the impression that
it should have been 255 (where /dev/lvm occupies minor number 0 for the
LVM Character device interface).

Can someone clarify?

Thanks,
- Kishore
