Return-Path: <laytonjb@mindspring.com>
Message-Id: <3.0.1.32.20010211132021.007a44f0@pop.mindspring.com>
Date: Sun, 11 Feb 2001 13:20:21 -0500
From: Jeff Layton <laytonjb@mindspring.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [linux-lvm] Newbie: Recommendations for setting up /home?
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello,

  I'm getting ready to redo our /home filesystem. We currently
have 5 18 Gig SCSI drives on one SCSI controller. They /home1,
/home2, etc. I want to convert this to /home using LVM. Are
there any recommendations for partitioning, etc, to keep the
throughput as large as possible? Will I be limited because
of the one SCSI bus (can't afford a RAID controller right now).

TIA,

Jeff Layton
