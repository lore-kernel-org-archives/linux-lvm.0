From: Alexander Lazarevich <alazarev@itg.uiuc.edu>
Subject: re[2]: [linux-lvm] resize LV
In-Reply-To: <20030128213855.TEPP16014.imf25bis.bellsouth.net@marsha>
Message-ID: <Pine.LNX.4.44.0301281541550.7780-100000@zeus.itg.uiuc.edu>
MIME-Version: 1.0
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
Date: Tue Jan 28 15:43:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM Mailing list <linux-lvm@sistina.com>

awesome links, thanks.

any word on if the 2.6 kernel will also add support for resizing ext3 
mounted filesystems? all it talks about on the site is ext2. but ext3 is 
just ext2 with a journal, right? so it should work for ext3 as well, 
right?

alex

On Tue, 28 Jan 2003, Greg Freemyer wrote:

>  >>  JFS can totally do it. I've been using AIX before we moved to Linux, and I
>  >>  
>  >>  did it all the time.
> 
>  >>  There must be a way to do it on linux systems using ext3. Anyone?
> 
>  >>  Alex
>  >>  ---                                                        ---
>  >>  Alex Lazarevich | Systems | Imaging Technology Group
>  >>  alazarev@itg.uiuc.edu | (217)244-1565 | www.itg.uiuc.edu
>  >>  ---    
>                                                     ---
> There is a project just for ext2 online resizing: http://sourceforge.net/projects/ext2resize/
> 
> The actual patches are at http://cvs.sourceforge.net/cgi-bin/viewcvs.cgi/ext2resize/ext2resize/patches/
> 
> And it is on the todo list for the pre-2.6.0 kernel release, so as at some point it will be in the vanilla kernel. http://kernelnewbies.org/status/latest.html
> 
> Greg Freemyer
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
