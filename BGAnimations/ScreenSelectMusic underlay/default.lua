local t = Def.ActorFrame {};

if not GAMESTATE:IsCourseMode() then
	local function JacketUpdate(self)
		local song = GAMESTATE:GetCurrentSong();
		local Background = self:GetChild("Background");
		local height = Background:GetHeight();
		
		if song then
			if song:HasJacket() then
				Background:visible(true);
				Background:Load(song:GetBackgroundPath());
				Background:scaletoclipped(1920,1080);
			else
				Background:visible(true);
				Background:Load(song:GetBannerPath());
				Background:scaletoclipped(1580,720);
			end;
		else
			Jacket:visible(false);
		end;
		
	end;
	t[#t+1] = Def.ActorFrame {
		InitCommand=cmd(x,SCREEN_CENTER_X+100;y,SCREEN_CENTER_Y;diffusealpha,0.25;SetUpdateFunction,JacketUpdate);
		OnCommand=cmd(x,SCREEN_CENTER_X+100;sleep,3;linear,0.25;diffusealpha,0.25;accelerate,3.25;x,SCREEN_CENTER_X-100;sleep,2;accelerate,3.25;x,SCREEN_CENTER_X+100;queuecommand,"On");
		Def.Sprite {
			Name="Background";
		};	
	};
end;

return t
