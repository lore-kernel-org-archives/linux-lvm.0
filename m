From: "Rene Olsen" <rene_olsen@post3.tele.dk>
MIME-Version: 1.0
Message-ID: <3F679A44.6121.CED1C6A@localhost>
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: [linux-lvm] pvscan showing 0 free on all PV's.
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
Date: Wed Sep 17 07:07:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/html; charset="us-ascii"
To: linux-lvm@sistina.com

<?xml  version="1.0" ?><html>
<head>
<title></title>
</head>
<body>
<div align="left"><font face="Arial"><span style="font-size:10pt">Hi.</span></font></div>
<div align="left"><br/></div>
<p><font face="Times New Roman" size="3"><span style="font-size:12pt">&gt;df shows how much free space there is on the *filesystem*. Even if the 
&gt;filesystem isn't full, it can occupy the entire lvm, which occupies the entire 
&gt;volume group. If you have only one filesystem on the lvm, then you may or may 
&gt;not have a problem, depending on what filesystem you are using. If you are 
&gt;using ext2 or ext3, then you can probably do an ext2resize to shrink it, followed 
&gt;by an lvreduce to reduce the size of the partition that the filesystem lives on, but 
&gt;*DANGER* *DANGER* *DANGER*. Reducing the size of an existing 
&gt;filesystem is inherently dangerous, so back up, tread with caution, and don't 
&gt;blame me when a meteorite flattens your house. If you are using reiserfs, jfs, or 
&gt;xfs, you are probably out of luck, as these filesystems don't currently support 
&gt;reduction. </span></font></p>
<div align="left"><br/>
</div>
<div align="left"><font face="Times New Roman" size="3"><span style="font-size:12pt">So what I should do is the following:</span></font></div>
<div align="left"><br/>
</div>
<div align="left"><font face="Times New Roman" size="3"><span style="font-size:12pt">Lets say the 200GB disc is 6000 PE's big.</span></font></div>
<div align="left"><br/>
</div>
<div align="left"><font face="Times New Roman" size="3"><span style="font-size:12pt">e2fsadm -v -l -6076 /dev/vol1/lv_vol</span></font></div>
<div align="left"><br/>
</div>
<div align="left"><font face="Times New Roman" size="3"><span style="font-size:12pt">This should make the lvm 200GB smaler.</span></font></div>
<div align="left"><br/>
</div>
<div align="left"><font face="Times New Roman" size="3"><span style="font-size:12pt">Then after that I do</span></font></div>
<div align="left"><br/>
</div>
<div align="left"><font face="Times New Roman" size="3"><span style="font-size:12pt">pvmove /dev/hdh1</span></font></div>
<div align="left"><br/>
</div>
<div align="left"><font face="Times New Roman" size="3"><span style="font-size:12pt">That should then move the content of hdh1 to the other drives ?</span></font></div>
<div align="left"><br/>
</div>
<div align="left"><font face="Times New Roman" size="3"><span style="font-size:12pt">Sorry, but I am a bit lost here.</span></font></div>
<div align="left"><br/>
</div>
<div align="left"><font face="Times New Roman" size="3"><span style="font-size:12pt">All I want to do is to get the 200GB out of the lvm.</span></font></div>
<div align="left"><br/>
</div>
<div align="left"><font face="Times New Roman" size="3"><span style="font-size:12pt">I am running ext2 and there is just that lvm on the system and a small 6GB system 
disc.</span></font></div>
<div align="left"><br/>
</div>
<div align="left"><font face="Times New Roman" size="3"><span style="font-size:12pt">Best regards</span></font></div>
<div align="left"><br/>
</div>
<div align="left"><font face="Times New Roman" size="3"><span style="font-size:12pt">Rene Olsen</span></font></div>
<div align="left"><br/>
</div>
<div align="left"></div>
</body>
</html>
