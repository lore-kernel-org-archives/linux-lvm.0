Return-Path: <warl0k@lvcm.com>
Message-ID: <3B7A240E.6090006@lvcm.com>
Date: Wed, 15 Aug 2001 00:26:06 -0700
From: Glenn Shannon <warl0k@lvcm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-Path: warl0k@lvcm.com
Subject: [linux-lvm] VGscan and CDROM devices
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
To: Linux LVM Mailing List <linux-lvm@sistina.com>

Hi all.

At boot, there is a good 20 second pause while vgscan runs because it 
tries to scan the CD drive.

Is there a way to stop this?

Also, interesting note: If it scans the CD and there is data on it the 
vgchange errors out saying it can't find the names of the devices....


Glenn
