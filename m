Message-ID: <20030821073958.15125.qmail@ispower.org>
From: "Joao Rechena" <security@rechena.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Inode problems
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
Date: Thu Aug 21 09:09:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: linux-lvm@sistina.com

Greetings, I'm using LVM for almost 6 months without any problem..
2 days ago on of my filesystems filled up to 100%, then with the fs full 
I've enlarged it, and everithing looked to be ok, except that when I then 
tried to mkdir anything It returned to me the msg "Device is full", wierd. 

I cleaned the fs a little and then reducit again, with the e2fsadm command, 
everithing looked to started working fine again, until I've made a dmesg and 
discovred this: 

EXT2-fs error (device lvm(58,1)): ext2_check_page: bad entry in directory 
#344422: directory entry across blocks - offset=12440, inode=411202, 
rec_len=16420, name_len=28 

Can anyone tell-me how to solve this ? 

I've enlarged the fs again, deleted the dir with that inode, but the problem 
presists. 

Best Regards 

rech 

Joao Rechena 
