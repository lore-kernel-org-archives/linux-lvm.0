Message-ID: <3737F4B7.6E582E4F@ep-ag.com>
Date: Tue, 11 May 1999 09:13:27 +0000
From: Klaus Strebel <stb@ep-ag.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Local GFS on lvm
References: <37371CFE.F8B329D4@ep-ag.com> <873e14kaw7.fsf@loom.sax.de>
Content-Transfer-Encoding: 8bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: Sven Rudolph <sr1@loom.sax.de>
Cc: linux-lvm@msede.com, teigland@lcse.umn.edu

Hi Sven,

Sven Rudolph wrote:

> Sorry: What�s gfs?

GFS (Global File System) is a filesystem for shared disks (ex. Disk-Pool
on a Fire-Channel or a shared SCSI-Bus -> one step to storage area
networking on linux !).
See <http://gfs.lcse.umn.edu> for details.

Ciao
Klaus

P.S.: Thanks Dave for your quick response. I�ve some trubble with the
locking module,  it doesn�t find register_lock_proto,
unregister_lock_proto, though gfs.o is loaded ? But i think  i can work
it out ;-).
-- 
Klaus Strebel
stb@ep-ag.com
EIGNER + PARTNER AG   - The Engineering Warehouse Company -
<http://www.ep-ag.com>
-----------------------------------------------------------------------
In Heaven there will be no DOS, no Intel, and above all, no Bill Gates.
