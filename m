From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re[2]: [linux-lvm] resize LV
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030128213855.TEPP16014.imf25bis.bellsouth.net@marsha>
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
Date: Tue Jan 28 15:37:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>linux-lvm@sistina.com

 >>  JFS can totally do it. I've been using AIX before we moved to Linux, and I
 >> =20
 >>  did it all the time.

 >>  There must be a way to do it on linux systems using ext3. Anyone?

 >>  Alex
 >>  ---                                                        ---
 >>  Alex Lazarevich | Systems | Imaging Technology Group
 >>  alazarev@itg.uiuc.edu | (217)244-1565 | www.itg.uiuc.edu
 >>  ---   =20
                                                    ---
There is a project just for ext2 online resizing: =
http://sourceforge.net/projects/ext2resize/

The actual patches are at =
http://cvs.sourceforge.net/cgi-bin/viewcvs.cgi/ext2resize/ext2resize/patches/

And it is on the todo list for the pre-2.6.0 kernel release, so as at some =
point it will be in the vanilla kernel. =
http://kernelnewbies.org/status/latest.html

Greg Freemyer
