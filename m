Return-Path: <wim@comned.com>
From: "wim bakker" <wim@comned.com>
Date: Thu, 25 Jan 2001 01:37:58 +0100
Message-ID: <web-8140650@comned.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] vgextend segfaults reprise
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

Thanks for the answers, yes I didn't apply patches to the
2.4.0
and 2.4.1-pre10 kernel, I hadn't read the README in the
PATCHES directory because I thought lvm support in the
kernel meant I didn't had to apply patches, but that was a
mistake on my side
All works very fine now, I have now a 174G gv consisting of
4 pv's , all assigned to one lv (sounds cool) I made
reiserfs on it when I had created the lv for the first time
(only one pv in the vg) , made filesystem with reiserfs and
one by one I added the other pv's using vgextend and
lvextend and resize_reiserfs and it worked out great, no
problems, great!!!
wim bakker
ComNed Netwerken BV
31 20 4350025
