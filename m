From: "kevin mcmahon" <thirty1@hotmail.com>
Mime-Version: 1.0
Message-ID: <Law11-F31oTVK4GB7DE0001820c@hotmail.com>
Subject: [linux-lvm] root vg
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
Date: Mon Sep 15 15:30:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

IA64 system, lvm1, raid-1 config, 2.4.20 kernel with lvm and md being loaded 
as modules, ext3 fs being used on all data partitions.

I can boot the system but after logging in my root partition shows that it 
is 100% used (via df).  I am probably missing something in the configuration 
of the system but can't find (via the archives or google) what could cause 
this symptom.

Excerpt of the df readout:

# df -h
Filesystem            Size  Used Avail Use% Mounted on
<snip>
/dev/vg00/root        1.2G  1.2G     0 100% /
/dev/vg00/var         984M   44M  891M   5% /var
/dev/vg00/usr         1.3G  673M  635M  52% /usr
</snip>

_________________________________________________________________
Get 10MB of e-mail storage! Sign up for Hotmail Extra Storage.  
http://join.msn.com/?PAGE=features/es
