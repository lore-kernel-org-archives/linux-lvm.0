Message-ID: <3E1E053E.5060802@liquidweb.com>
From: "Ross S." <ross@liquidweb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvremove
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
Date: Thu Jan  9 17:23:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Has anyone had this problem?

I went to remove a vserver, after stopping it, and I could not unmount 
it.  The error received was 'device is busy'.  I verified the vserver 
was stopped, I was not in the vserver's cwd, and (through lsof) there 
were no processes being used for the vserver or calling it. Has anyone 
else experienced this problem? And if so, is anyone aware of a solution 
(other than reboot with modified fstab)?

- Ross S.
