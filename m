Return-Path: <milang@tal.org>
Message-ID: <002501c0cfc5$e5ab7560$56dc10c3@tal.org>
From: "Kaj-Michael Lang" <milang@tal.org>
Date: Sat, 28 Apr 2001 12:30:36 +0300
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM 0.9.1beta7 and 2.4.4 (get_hardblocksize removed)
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

Looks like the function:
get_hardblocksize(kdev_t dev)

has been removed in 2.4.4. And LVM uses it in two places. 
Can someone fix it ?

--
Kaj-Michael Lang
milang@tal.org
Java? I've heard of it, it is what I drink while hacking PHP! 
